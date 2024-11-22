import {
  BrowserRouter as Router,
  Routes,
  Route,
  Navigate,
} from "react-router-dom";
import ChatInterface from "./components/Chat";
import Home from "./components/Home";
import Frame from "./components/Frame";
import HomePage from "./components/HomePage";
import HospitalPage from "./pages/NearbyHospitalPage";
import DisasterHeatmap from "./pages/DisasterPage";
import Weather from "./components/Weather";

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/hospital" element={<HospitalPage />} />
        <Route path="/disaster" element={<DisasterHeatmap />} />
        <Route path="/weather" element={<Weather />} />
        <Route path="/frame" element={<Frame />} />
      </Routes>
    </Router>
  );
}

export default App;
